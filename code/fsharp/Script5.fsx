let input placeholder =
    printf placeholder
    System.Console.ReadLine()

let n = int(input "Please enter n: ")
let l = [
    for i in [1..n] do
        yield i
]
printfn "%A" l