import JWT

struct MusicTokenFactory {
    let kid: String
    let teamId: String
    let expiration: Seconds
    private let signer: ECDSASigner
    
    init(key: Bytes, kid: String, teamId: String, expiration: Seconds = 3600) {
        signer = ES256(key: key)
        self.kid = kid
        self.teamId = teamId
        self.expiration = expiration
    }
    
    func createToken() throws -> String {
        var headers = JSON()
        try headers.set("alg", "ES256")
        try headers.set("kid", kid)
        
        let now = Int(time(nil))
        var payload = JSON()
        try payload.set("iat", now)
        try payload.set("iss", teamId)
        try payload.set("exp", now + expiration)
        let jwt = try JWT(headers: headers,
                          payload: payload,
                          signer: signer)
        
        return try jwt.createToken()
    }
}

