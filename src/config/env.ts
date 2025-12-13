export const env = {
  nodeEnv: process.env.NODE_ENV ?? "development",
  host: process.env.HOST ?? "0.0.0.0",
  port: Number(process.env.PORT ?? 3000)
}

if (!Number.isFinite(env.port) || env.port <= 0) {
  throw new Error("PORT must be a positive number")
}
