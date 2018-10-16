variable "access_key" {
    default = "ACCESS_KEY"
} 
variable "secret_key" {
    default = "SECRET_KEY"
}
variable "region" {
  default = "us-east-1"
}
variable "ami" {
  default = "ami-9887c6e7"
}
variable "size" {
  default = "t2.micro"
}
variable "myip" {
  type = "list"
  default = ["YOURIP"]
}
variable "pub_key" {
  default = "ssh-rsa YOUR_PRIVATE_KEY"
}
