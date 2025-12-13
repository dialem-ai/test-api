export async function registerHealthRoutes(app) {
    app.get("/health", async () => {
        return { status: "ok" };
    });
}
export async function additionWithParams(app) {
    app.get("/add/:a/:b", async (request) => {
        const { a, b } = request.params;
        const result = Number(a) + Number(b);
        return { "result": result,
            "status": "200"
        };
    });
}
