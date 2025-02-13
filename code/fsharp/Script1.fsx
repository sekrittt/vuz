let input placeholder =
    printf placeholder
    System.Console.ReadLine()


let m x =
    int(x % 1000. / 100.)
let sm x =
    int(x % 100.)
let mm x =
    x % 1.

let v = input "Please enter value to convert: "
let _v = (float v) * 2.54
printfn "%d m %d sm %g mm" (m _v) (sm _v) (mm _v)
