import { pool } from "./database.js";

class LibroController {
  //Mostrar todos los libros
  async getAll(req, res) {
    try {
      const [result] = await pool.query("SELECT * FROM libros");
      res.json(result);
    } catch (err) {
      res.status(500).json({
        error: "No se pudo obtener la lista de libros",
        details: err.message,
      });
    }
  }

  //Mostrar un solo libro
  async getOne(req, res) {
    try {
      const libro = req.body; // Obtener el libro del cuerpo de la solicitud

      if (!libro.id_libro) {
        return res
          .status(400)
          .json({
            error: "Se requiere el id_libro en el cuerpo de la solicitud",
          });
      }

      const [result] = await pool.query(
        "SELECT * FROM libros WHERE id_libro = ?",
        [libro.id_libro]
      );

      if (result.length === 0) {
        return res.status(404).json({ error: "El libro no existe" });
      }

      res.json(result[0]); // Devolver el primer (y único) resultado
    } catch (err) {
      res.status(500).json({ error: "No se pudo obtener el libro" });
    }
  }

  //Agregar un libro
  async add(req, res) {
    try {
      const libro = req.body;
      // Validar si se están enviando campos adicionales no permitidos
      const allowedFields = [
        "titulo",
        "autor",
        "categoria",
        "ano_publicacion",
        "genero",
        "sinopsis",
        "isbn",
      ];
      const extraFields = Object.keys(libro).filter(
        (key) => !allowedFields.includes(key)
      );
      if (extraFields.length > 0) {
        return res.status(400).json({
          error: `Los campos ${extraFields.join(", ")} no están permitidos.`,
        });
      }

      const [result] = await pool.query(
        `INSERT INTO libros (titulo, autor, categoria, ano_publicacion, genero, sinopsis, isbn) VALUES (?, ?, ?, ?, ?, ?, ?)`,
        [
          libro.titulo,
          libro.autor,
          libro.categoria,
          libro.ano_publicacion,
          libro.genero,
          libro.sinopsis,
          libro.isbn,
        ]
      );
      res.json({ "Id insertado": result.insertId });
    } catch (err) {
      res
        .status(500)
        .json({ error: "No se pudo agregar el libro", details: err.message });
    }
  }

  //Eliminar un libro
  async delete(req, res) {
    try {
      const libro = req.body;

      // Verificar si el libro existe antes de actualizar
      const [exists] = await pool.query(`SELECT * FROM libros WHERE isbn = ?`, [
        libro.isbn,
      ]);
      if (exists.length === 0) {
        return res.status(404).json({ error: "El libro no existe" });
      }
      const [result] = await pool.query(`DELETE FROM libros WHERE isbn=(?)`, [
        libro.isbn,
      ]);
      res.json({ "Registros Eliminados": result.affectedRows });
    } catch (err) {
      res
        .status(500)
        .json({ error: "No se pudo eliminar el libro", details: err.message });
    }
  }

  //Actualizar datos de un libro
  async update(req, res) {
    try {
      const libro = req.body;

      // Verificar si el libro existe antes de actualizar
      const [exists] = await pool.query(`SELECT * FROM libros WHERE isbn = ?`, [
        libro.isbn,
      ]);
      if (exists.length === 0) {
        return res.status(404).json({ error: "El libro no existe" });
      }
      const [result] = await pool.query(
        `UPDATE libros SET titulo=?, autor=?, categoria=?, ano_publicacion=?, genero=?, sinopsis=?, isbn=? WHERE id_libro=?`,
        [
          libro.titulo,
          libro.autor,
          libro.categoria,
          libro.ano_publicacion,
          libro.genero,
          libro.sinopsis,
          libro.isbn,
          libro.id_libro,
        ]
      );
      res.json({ "Registros actualizado": result.changedRows });
    } catch (err) {
      res.status(500).json({
        error: "No se pudo actualizar el libro",
        details: err.message,
      });
    }
  }
}
export const libro = new LibroController();
