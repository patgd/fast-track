# Network Requests
- Type for storing URLs: `URL`
# Loading JSON Data
# Creating Content Grids<!-- {"fold":true} -->
- `LazyVGrid`
  - columns are passed to vertical grids
- `LazyHGrid`
  - rows are passed to horizontal grids
# Scrolling a View<!-- {"fold":true} -->
- `ScrollView`
  - control direction: first arg
  - scroll bar visibility: second arg
# Abstracting Complex Views

# Store Property-Value Across Program Executions
- `@AppStorage` property wrapper
  - `@AppStorage(“var1”) var var1 = “”`


# Conforming to `Identifiable` Protocol
- Purpose: tell SwiftUI how to uniquely identify a structure.
- How:
  1. Conform to `Identifiable`
  2. Define a property named `id`
     - Often you can make this a computed proprety of some other property: `var id: Int { someProperty1 }`
- 