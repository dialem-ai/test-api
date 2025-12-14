import Fastify from "fastify";
import { additionWithQuery, registerHealthRoutes } from "./routes/health.js";
export function buildServer() {
    const app = Fastify({ logger: true });
    app.register(registerHealthRoutes);
    app.register(additionWithQuery);
    return app;
}
