locals {
  USER_ID      = var.USER_ID == "" ? "defaultUser" : var.USER_ID
  ENV_ID       = var.ENV_ID == "" ? "defaultId" : var.ENV_ID
  prefix_id    = "${local.USER_ID}_${local.ENV_ID}"
  prefix       = "${local.prefix_id}_${var.prefix}"
  item_id_lock = "CMDB_lock_${local.USER_ID}_${local.ENV_ID}_${var.app_name}_${var.prefix}"
  item_id_data = "CMDB_data_${local.USER_ID}_${local.ENV_ID}_${var.app_name}_${var.prefix}"
  tags_app = {
    "Name"     = "${local.prefix}-${var.app_name}"
    "app_name" = var.app_name
  }
  subnets         = module.vpc.public_subnets_by_type.public.ids
  vpc_id          = module.vpc.vpc_raw.id
  subnets_az_cmdb = join(",", local.subnets)

}
