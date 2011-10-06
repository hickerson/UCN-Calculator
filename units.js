// unit per neV: neV, Tesla, Gauss, meters, cm, Kelvin, mK
// unit per m/s: m/s, cm/s, seconds
var units = {
    "neV" : {
        words: "has energy", 
        exp: 1, 
        coef: 1
    },
    "Tesla" : {
        words: "is repelled by a field of",
        exp: 1, 
        coef: 60.3077
    },
    "Gauss" : {
        words:  "is repelled by a field of",
        exp: 1, 
        coef: 0.00603077
    },
    "meters" : {
        words:  "falls from",
        exp: 1, 
        coef: 102.519
    },
    "cm" : {
        words:  "falls from",
        exp: 1, 
        coef: 1.02519
    },
    "Kelvin" : {
        words: "has temperature",
        exp: 1, 
        coef: 86173.4
    },
    "mK" : {
        words: "has temperature",
        exp: 1, 
        coef: 86.1734
    },
    "m/s" : {
        words: "is moving at",
        exp: 2, 
        coef: 5.2270385
    },
    "cm/s" : {
        words: "is moving at",
        exp: 2, 
        coef: 0.00052270385
    },
    "seconds": {
        words: "reaches apogee in",
        exp: 2, 
        coef: 502.686
    },
    "nm": {
        words: "hasa wavelength of",
        exp: -2, 
        coef: 818042
    }
};
