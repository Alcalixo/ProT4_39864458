import { pool } from "./database.js";

class LibroController {
  async getAll(req, res) {
    const [result] = await pool.query("SELECT * FROM libros");
    res.json(result);
  }

  async add(req, res) {
    const libro = req.body;
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
  }

  async delete(req, res) {
    const libro = req.body;
    const [result] = await pool.query(`DELETE FROM libros WHERE id_libro=(?)`, [
      libro.id_libro,
    ]);
    res.json({ "Registros Eliminados": result.affectedRows });
  }

  async update(req, res) {
    const libro = req.body;
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
  }
}
export const libro = new LibroController();
