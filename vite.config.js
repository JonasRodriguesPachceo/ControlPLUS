import { defineConfig } from "vite";
import laravel from "laravel-vite-plugin";

export default defineConfig({
    server: {
        host: process.env.VITE_HOST || "0.0.0.0",
        port: Number(process.env.VITE_PORT || 5173),
        strictPort: true,
        hmr: {
            host: process.env.VITE_HMR_HOST || "localhost", // ajuste se acessar por IP/domínio
            protocol: "ws",
            port: Number(process.env.VITE_PORT || 5173),
        },
        watch: {
            usePolling: process.env.CHOKIDAR_USEPOLLING === "true",
        },
    },
    plugins: [
        laravel({
            input: ["resources/css/app.css", "resources/js/app.js"],
            refresh: true,
        }),
    ],
});
