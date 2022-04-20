script;

fn main() -> u64 {
    let foo = 11;
    let bar = match foo {
        10 => { 0 },
        _ => { 1 },
    };
}
