# Network Requests
- Type for storing URLs: `URL`
# Loading JSON Data
# Creating Content Grids<!-- {"fold":true} -->
- `LazyVGrid`
  - columns are passed to vertical grids
- `LazyHGrid`
  - rows are passed to horizontal grids
# Scrolling a View
- `ScrollView`
  - control direction: first arg
  - scroll bar visibility: second arg
# Abstracting Complex Views

# Store Property-Value Across Program Executions<!-- {"fold":true} -->
- `@AppStorage` property wrapper
  - `@AppStorage(βvar1β) var var1 = ββ`


# Conforming to `Identifiable` Protocol<!-- {"fold":true} -->
- Purpose: tell SwiftUI how to uniquely identify a structure.
- How:
  1. Conform to `Identifiable`
  2. Define a property named `id`
     - Often you can make this a computed proprety of some other property: `var id: Int { someProperty1 }`
- 