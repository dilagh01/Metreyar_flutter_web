FutureBuilder<String>(
  future: ApiService.fetchHello(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return const CircularProgressIndicator();
    } else if (snapshot.hasError) {
      return Text("❌ Error: ${snapshot.error}");
    } else {
      return Text(snapshot.data ?? "No response");
    }
  },
)
