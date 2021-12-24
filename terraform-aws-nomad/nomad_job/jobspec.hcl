job "webapp" {
	datacenters = ["dc1"]
    region = "global"

	group "app" {
		network {
			mode = "host"
			port "http" {
				to = "8080"
			}
		}

		task "app" {
			env {
				PORT = 8080
				DB_USER = "postgresql"
				DB_PASS = "postgresql"
				DB_HOST = "DB_ENDPOINT" # FILL THIS WITH THE ENDPOINT OUTPUT FROM DB TF MODULE
				DB_PORT = 5432
				DB_NAME = "postgresql"
				DB_PARAMS = "sslmode=disable"
			}
			driver = "docker"

			config {
				image = "marcinpolymath/simplewebapp"
				ports = ["http"]
			}
		}
	}
}