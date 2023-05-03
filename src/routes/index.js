const { Router } = require('express');
const router = Router();
const { getClientes, getClienteById, createCliente, updateCliente, deleteCliente } = require('../controllers/index.controller');



router.get('/clientes', getClientes);
router.get('/clientes/:codcli', getClienteById);
router.post('/clientes', createCliente);
router.put('/clientes/:codcli', updateCliente);
router.delete('/clientes/:codcli', deleteCliente);

module.exports = router;