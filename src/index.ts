import "dotenv/config"
import { env } from "./config/env.js"
import { buildServer } from "./server.js"

const app = buildServer()

try {
  await app.listen({ host: env.host, port: env.port })
} catch (err) {
  app.log.error(err)
  process.exit(1)
}
