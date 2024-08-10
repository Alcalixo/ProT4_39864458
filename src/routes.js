import { Router } from "express";
import { libro } from "./controller.js";

export const router = Router();
router.get("/libros", libro.getAll); //Traer todos
router.post("/un_libro", libro.getOne); //Traer uno
router.post("/subir_libro", libro.add); //Agregar Libro
router.delete("/borrar_libro", libro.delete); //Eliminar libro
router.put("/editar_libro", libro.update); //Actualizar libro
