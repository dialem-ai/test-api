import "dotenv/config"
import { env } from "./config/env.js"
import { buildServer } from "./server.js"

const app = buildServer()

console.log("Prisma connected to the database")

try {
  await app.listen({ host: env.host, port: env.port })
} catch (err) {
  app.log.error(err)
  process.exit(1)
}

const shutdown = async () => {
  process.exit(0)
}

process.on("SIGINT", shutdown)
process.on("SIGTERM", shutdown)