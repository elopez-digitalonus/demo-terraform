variable "ami" {
  default = "ami-00517306b63c4628c"
}


variable "instance_type" {
  default = "t3.micro"
}


variable "ssh_0545_key_pair" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDahnm8kyWebdt+xLRnxu72hY/ReUqxJLfOkl/ssPYmKXDAzC4Rji6z7foineWqia0TNXYulEWX0Cbi9yrvI/PrWxWXcIAMfh09n/ndy2PN9JIz7r4LSGUQyTIllckkZNq+64uAe8GbmSdMWLF5Y6AXF6IW+rIbwRHMBfhsRV8SqByv5thPmmDILPq7VdyLHJDWJ+Qtq8MeefslR4LnUNGF7XXfxL59kg1bjceV++sWKFI0g4gjPn3/VtV7y2Ad8yx9zCE9WWm8d5RJsxXrCj2+4Bvonb9mPCplA/d8ceHENej8MDwtaESK44rlb+KzsPmUM8NL8Ku6FBzCxIvDm4RRmSfViNg1YMmapynXkHxRVEunnhZb8lDAxwOfCS38V9HVDjhXS2XlNSHXwxRmlhLT0PryPqEkkgO+f0fIyf9mYPEGL3KiZnwgkw7zY9HNPv2ahafY2e7ni48XvQdko8AlcEoawVPMmFnosMp/EXt48lRoK8vJeGakxPSHIpu+JMM= eduardolopez@0545.local"
}


variable "sg_dmz_id" {
  description = "SG id for 0545 dmz"
}


variable "subnet_dmz_id" {
  description = "Subnet dmz id"
}


variable "kms_key_id" {
  description = "KMS key id"
}
