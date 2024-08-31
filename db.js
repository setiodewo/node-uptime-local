// Author: Emanuel Setio Dewo, 23/07/2024

import mysql from 'mysql2/promise.js';

const db = await mysql.createConnection({
    host: 'localhost',
    user: 'uptime',
    password: 'upt1m3_local',
    database: 'uptime'
});

console.log('DB Connected');

export default db;