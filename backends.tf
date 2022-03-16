terraform {
  cloud {
    organization = "LUIT-Green-Team"

    workspaces {
      name = "docker-project"
    }
  }
}

#test