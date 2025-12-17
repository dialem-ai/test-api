// import type { FastifyPluginAsync } from "fastify"
// import { prisma } from "../lib/prisma.js"

// export const registerUserRoutes: FastifyPluginAsync = async (app) => {
//   app.post<{ Body: { email: string; name?: string } }>("/users", async (request, reply) => {
//     const { email, name } = request.body ?? {}
//     if (!email) return reply.code(400).send({ error: "email_required" })

//     const user = await prisma.user.create({
//       data: { email, name },
//       select: { id: true, email: true, name: true, createdAt: true },
//     })

//     return user
//   })

//   app.get<{ Params: { id: string } }>("/users/:id", async (request, reply) => {
//     const id = Number(request.params.id)
//     if (!Number.isFinite(id)) return reply.code(400).send({ error: "invalid_id" })

//     const user = await prisma.user.findUnique({
//       where: { id },
//       select: { id: true, email: true, name: true, createdAt: true },
//     })

//     if (!user) return reply.code(404).send({ error: "not_found" })
//     return user
//   })
// // }
