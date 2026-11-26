import ModelIO

func err(_ string: String) {
    try! FileHandle.standardError.write(contentsOf: Data("\(string)\n".utf8))
    exit(1)
}

if CommandLine.arguments.count < 3 {
    err("Usage: \(CommandLine.arguments[0]) [in] [out]")
}

let asset = MDLAsset(url: URL(fileURLWithPath: CommandLine.arguments[1]))

do {
    try asset.export(to: URL(fileURLWithPath: CommandLine.arguments[2]))
} catch {
    err("\(error)")
}
