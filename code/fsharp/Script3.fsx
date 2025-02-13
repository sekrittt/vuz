let input placeholder =
    printf placeholder
    System.Console.ReadLine()

let sumDels x =
    (List.sum [for i in [1..int(x/2)] do yield i]) + x

let x = int (input "Enter x: ")
printfn "Result: %d" (sumDels x)