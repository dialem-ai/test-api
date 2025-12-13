import type { FastifyInstance } from "fastify"

export async function registerHealthRoutes(app: FastifyInstance) {
  app.get("/health", async () => {
    return { status: "ok" }
  })
}

export async function additionWithQuery(app: FastifyInstance) {
  app.get<{ Querystring: { a?: string; b?: string } }>("/add", async (request, reply) => {
    const a = Number(request.query.a)
    const b = Number(request.query.b)
    if (!Number.isFinite(a) || !Number.isFinite(b)) {
      return reply.status(400).send({ error: "query params 'a' and 'b' must be numbers" })
    }
    return { result: a + b, status: "200" }
  })
}


export async function additionPost(app: FastifyInstance) {
  app.post<{ Body: { a: number; b: number } }>("/add", async (request) => {
    const { a, b } = request.body
    const result = a + b
    return { result }
  })
}