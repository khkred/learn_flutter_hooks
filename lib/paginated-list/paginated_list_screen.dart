import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class PaginatedListScreen extends HookWidget {
  const PaginatedListScreen({super.key});

  Future<List<String>> fetchPage(int page) async {
    await Future.delayed(
        const Duration(seconds: 2)); // Simulating network delay

    return List.generate(10, (index) => 'Item ${page * 10 + index + 1}');
  }

  @override
  Widget build(BuildContext context) {
    final _page = useState(0);
    final _items = useState<List<String>>([]);
    final _isFetching = useState(false);

    void _fetchNextPage() async {
      if (_isFetching.value) return;

      _isFetching.value = true;
      final newItems = await fetchPage(_page.value);

      // We are using a spread operator to combine both arrays into a new array
      _items.value = [..._items.value, ...newItems];

      // Once we get the value. We have to increase the page number
      _page.value++;

      //Finally after fetching is done. We have to set _isFetching to false
      _isFetching.value = false;
    }

    useEffect(() {
      _fetchNextPage();
    }, []);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Paginated List'),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
            _fetchNextPage();
          }
          return true;
        },
        child: ListView.builder(
          itemCount: _items.value.length,
          itemBuilder: (context, index) {
            if (index == _items.value.length) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListTile(
              title: Text(_items.value[index]),
            );
          },
        ),
      ),
    );
  }
}
