// // shared/test/polyhedron_test.gleam

// import gleam/json
// import spherical_shapes.{type SphericalPolyhedron, SphericalPolyhedron}

// const polyhedron = Polyhedron(
//   id: 1,
//   name: "Buy groceries",
//   description: "Milk, eggs, bread",
//   completed: False,
// )

// const polyhedron_input = SphericalPolyhedron(
//   name: "Buy groceries",
//   description: "Milk, eggs, bread",
//   completed: False,
// )

// pub fn to_polyhedron_test() {
//   assert polyhedron.to_polyhedron(polyhedron_input, 1) == polyhedron
// }

// pub fn to_polyhedron_input_test() {
//   assert polyhedron.to_polyhedron_input(polyhedron) == polyhedron_input
// }

// pub fn polyhedron_to_json_test() {
//   assert polyhedron
//     |> polyhedron.polyhedron_to_json
//     |> json.to_string
//     |> json.parse(polyhedron.polyhedron_decoder())
//     == Ok(polyhedron)
// }

// pub fn polyhedron_input_to_json_test() {
//   assert polyhedron_input
//     |> polyhedron.polyhedron_input_to_json
//     |> json.to_string
//     |> json.parse(polyhedron.polyhedron_input_decoder())
//     == Ok(polyhedron_input)
// }
