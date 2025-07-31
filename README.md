# Unife Environment

This repository contains a Docker Compose environment for a modern development stack, including Traefik, Tailscale, Portainer, Postgres, Redis, RedisInsight, and pgAdmin.

## Services

- **traefik**: Reverse proxy and load balancer with dashboard and dynamic configuration support.
- **tailscale**: Mesh VPN for secure private networking. Allows containers to be accessed via Tailscale IPs.
- **portainer**: Web UI for managing Docker environments.
- **postgres**: PostgreSQL database server.
- **redis**: In-memory data store, used as a database, cache, and message broker.
- **redisinsight**: GUI for Redis management and monitoring.
- **pgadmin**: Web-based administration tool for PostgreSQL.

## Networks

- `traefik_net`: Main bridge network for all services.
- `tailscale_net`: Additional bridge network for Tailscale access. Portainer, Postgres, and Redis are also attached to this network for Tailscale IP access.

## Usage

1. **Before starting**
   - Run the `before_compose.sh` script to automatically install Tailscale and Docker, and reboot the machine if needed.

2. **Start the environment**
   - After reboot, run:
     ```sh
     docker compose up -d
     ```

3. **Tailscale**
   - The Tailscale container will join your Tailscale network. Set your `TS_AUTHKEY` in the environment or `.env` file for automatic authentication.

4. **Accessing Services**
   - Traefik routes HTTP(S) traffic to services based on host rules (see `docker_compose.yaml` labels).
   - Portainer, Postgres, and Redis are accessible via both the local Docker network and Tailscale IPs.

## Volumes

All persistent data is stored under the `dockerVol` directory, organized by service.

## Security

- Traefik is configured with middlewares for whitelisting and Cloudflare protection.
- Tailscale provides secure, private access to selected services.

## Customization

- Edit `docker_compose.yaml` to adjust service settings, networks, or volumes as needed.
- Update environment variables for database credentials and admin accounts as required.

---

For more information, see the documentation for each service:
- [Traefik](https://doc.traefik.io/traefik/)
- [Tailscale](https://tailscale.com/kb/)
- [Portainer](https://www.portainer.io/)
- [Postgres](https://www.postgresql.org/docs/)
- [Redis](https://redis.io/docs/)
- [RedisInsight](https://docs.redis.com/latest/ri/)
- [pgAdmin](https://www.pgadmin.org/docs/)
