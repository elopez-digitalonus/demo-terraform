
module "vpc" {
  source = "./modules/vpc"
}

module "vault" {
  source        = "./modules/vault"
  sg_dmz_id     = module.vpc.sg_dmz_id
  subnet_dmz_id = module.vpc.subnet_dmz_id
  kms_key_id    = module.vpc.kms_key_id
}
