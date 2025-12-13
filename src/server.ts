import Fastify from "fastify"
import { additionWithParams, registerHealthRoutes } from "./routes/health.js"

export function buildServer() {
  const app = Fastify({ logger: true })

  app.register(registerHealthRoutes)

  app.register(additionWithParams)
  return app
}