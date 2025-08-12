output "subnet" {
  description = "Полный объект созданной подсети"
  value       = yandex_vpc_subnet.this
}

output "subnet_id" {
  description = "ID подсети"
  value       = yandex_vpc_subnet.this.id
}