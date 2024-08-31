// Author : Emanuel Setio Dewo
// started: 31/08/2024

// Referensi:
// https://nodejs.org/api/os.html

// threshhold in percent
const ambang = {
    'cpu' : 90,
    'memory' : 80,
    'storage' : 80
}

import db from './db.js';
import os from 'os';
import space from 'check-disk-space';

var tgl = new Date();
var _tgl = tgl.getFullYear() + '-' +
    String(tgl.getMonth() + 1).padStart(2, '0') + '-' +
    String(tgl.getDate()).padStart(2, '0') + ' ' +
    String(tgl.getHours()).padStart(2, '0') + ':' +
    String(tgl.getMinutes()).padStart(2, '0') + ':' +
    String(tgl.getSeconds()).padStart(2, '0');

var res = {
    'timestamp': _tgl,
    'machine' : os.machine(),
    'arch' : os.arch(),
    'platform' : os.platform(),
    'release' : os.release(),
    'version' : os.version(),
    'type': os.type(),
    'hostname' : os.hostname(),
    'uptime' : os.uptime(),
    'uptimeminutes': os.uptime()/60,
    'uptimehours': os.uptime()/60/60,
    'uptimedays': os.uptime()/60/60/24,
    'totalmem' : os.totalmem(),
    'freemem' : os.freemem(),
    'cpus' : os.cpus(),
    'cpucount' : os.cpus().length,
    'loadavg' : os.loadavg(),
    'loadavgnow' : os.loadavg()[0],
    'userinfo' : os.userInfo()
}

// check disk space
const d = await space('/');

// save to database
try {
const [result, fields] = await db.query(`insert into res
    set timestamp = ?,
    ip = ?,
    machine = ?,
    arch = ?,
    platform = ?,
    \`release\` = ?,
    version = ?,
    type = ?,
    hostname = ?,
    uptime = ?,
    uptimeminutes = ?,
    uptimehours = ?,
    uptimedays = ?,
    totalmem = ?,
    freemem = ?,
    cpus = ?,
    cpucount = ?,
    loadavg = ?,
    loadavgnow = ?,
    userinfo = ?,
    storagepath = ?,
    storagesize = ?,
    storagefree = ?`, [
        res.timestamp,
        'localhost',
        res.machine,
        res.arch,
        res.platform,
        res.release,
        res.version,
        res.type,
        res.hostname,
        res.uptime,
        res.uptimeminutes,
        res.uptimehours,
        res.uptimedays,
        res.totalmem,
        res.freemem,
        JSON.stringify(res.cpus),
        res.cpucount,
        JSON.stringify(res.loadavg),
        res.loadavgnow,
        JSON.stringify(res.userinfo),
        d.diskPath,
        d.size,
        d.free
    ]);
} catch(err) {
    console.error('MYSQL', err.message());
}
process.exit();