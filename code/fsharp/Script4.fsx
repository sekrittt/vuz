let input placeholder =
    printf placeholder
    System.Console.ReadLine()

let A = float (input "Please enter A: ")
let N = int (input "Please enter N: ")

for i in [0..N] do
    let s = A ** i
    printfn "%d: %g" i s 