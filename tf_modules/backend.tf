terraform {
  backend "gcs" {
    bucket = "jb-demo-209016-secure-bucket-tfstate"
  }
}
