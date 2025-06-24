# Proveedor de AWS. Se toma la región desde las variables que se pasan al módulo.

provider "aws" {
  region = var.region
}

# VPC principal:
# - Crea el bloque de red base del proyecto.
# - Activamos DNS support y hostnames para que instancias puedan tener nombres resolvibles.
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name        = var.vpc_name
    Environment = "development"
  }
}

# Internet Gateway:
# - Recurso necesario para permitir salida a internet desde la subred pública.
# - Se asocia directamente con la VPC.
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "${var.vpc_name}-igw"
  }
}

# Subred pública:
# - Esta subred permite asignar IPs públicas automáticamente.
# - Ideal para el ALB o recursos que necesiten acceso desde fuera.
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.subnet_name}-public"
  }
}

# Subred privada 1:
# - No tiene salida directa a internet.
# - Usada para bases de datos u otros servicios internos.
resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = var.availability_zone

  tags = {
    Name = "${var.subnet_name}-private-1"
  }
}

# Subred privada 2:
# - Segunda subred privada (misma zona por ahora, pero preparada para multi-AZ).
resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = var.availability_zone

  tags = {
    Name = "${var.subnet_name}-private-2"
  }
}

# Tabla de rutas públicas:
# - Redirige todo el tráfico saliente (0.0.0.0/0) hacia el Internet Gateway.
resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.vpc_name}-public-rt"
  }
}

# Asociación entre la tabla de rutas públicas y la subred pública:
# - Necesaria para que la subred tenga acceso a internet.
resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}
