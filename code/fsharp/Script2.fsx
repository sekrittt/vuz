let input placeholder =
    printf placeholder
    System.Console.ReadLine()

let printNum x =
    printfn "%d" x

let x = int (input "Enter x: ")
let l = [
    for i in 1 .. x do
        if i % 3 = 0 then
            yield i
]
List.iter printNum l