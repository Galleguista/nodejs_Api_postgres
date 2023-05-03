const { Pool } = require('pg');

const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    password: 'Conan3123',
    database: 'postgres',
    port: '5432'
});

const getClientes = async (req, res) => {
    const response = await pool.query('SELECT * FROM clientes ORDER BY codcli ASC');
    res.status(200).json(response.rows);
};

const getClienteById = async (req, res) => {
    const id = parseInt(req.params.id);
    const response = await pool.query('SELECT * FROM clientes WHERE codcli = $1', [id]);
    res.json(response.rows);
};

const createCliente = async (req, res) => {
    const { codcli, nombre, direccion, codpostal, codpue } = req.body;
    const response = await pool.query('INSERT INTO clientes (codcli, nombre, direccion, codpostal, codpue) VALUES ($1, $2, $3, $4, $5)', [codcli, nombre, direccion, codpostal, codpue]);
    res.json({
        message: 'Cliente Added successfully',
        body: {
            cliente: {codcli, nombre, direccion, codpostal, codpue}
        }
    })
};

const updateCliente = async (req, res) => {
    const id = parseInt(req.params.id);
    const { codcli, nombre, direccion, codpostal, codpue } = req.body;

    const response =await pool.query('UPDATE clientes SET codcli = $1, nombre = $2, direccion = $3, codpostal = $4, codpue = $5 WHERE codcli = $6', [
        codcli,
        nombre,
        direccion,
        codpostal,
        codpue,
        id
    ]);
    res.json('Cliente Updated Successfully');
};

const deleteCliente = async (req, res) => {
    const id = parseInt(req.params.id);
    await pool.query('DELETE FROM clientes where codcli = $1', [
        id
    ]);
    res.json(`Cliente ${id} deleted Successfully`);
};

module.exports = {
    getClientes,
    getClienteById,
    createCliente,
    updateCliente,
    deleteCliente
};
