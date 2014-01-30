.pragma library

function refreshETA() {

    var ETA_ms = 800000000 * Math.random();
    return new Date(ETA_ms);
}
