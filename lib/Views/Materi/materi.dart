import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_analytic/Controllers/lesson_controller.dart';
import '../../Components/Widgets/Settings/navbar.dart';
import '../../Components/Widgets/Settings/appbar.dart';

class MateriPage extends StatefulWidget {
  const MateriPage({super.key});

  @override
  _MateriPageState createState() => _MateriPageState();
}

class _MateriPageState extends State<MateriPage> {
  bool isGridView = true; // Track whether grid or list view is selected

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final LessonController controller = Get.put(LessonController());

    // Fetch materi data when the page is loaded
    controller.fetchLesson();

    return Scaffold(
      backgroundColor: const Color(0xFFF7FAFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            // Toggle between GridView and ListView based on user selection
            return ListView(
              children: [
                const SizedBox(height: 16),
                CustomAppBar(judul: "Materi"),
                const SizedBox(height: 24),

                // 🔍 Search Bar
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(32),
                    boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Belajar apa hari ini?',
                      icon: Icon(Icons.search),
                    ),
                  ),
                ),

                const SizedBox(height: 24),
                // 🧩 Filter Row (Toggle between Grid and List)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Filter',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.grid_view_rounded),
                          color: isGridView ? Colors.blue : Colors.grey,
                          onPressed: () {
                            setState(() {
                              isGridView = true;
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.list_rounded),
                          color: !isGridView ? Colors.blue : Colors.grey,
                          onPressed: () {
                            setState(() {
                              isGridView = false;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                const Text(
                  'Rekomendasi',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF387FFF),
                  ),
                ),
                const SizedBox(height: 16),

                // Rekomendasi Materi (Grid or List)
                if (isGridView)
                  // GridView for recommendations
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 3 / 4,
                    ),
                    itemCount: controller.LessonList.length,
                    itemBuilder: (context, index) {
                      var materi = controller.LessonList[index];
                      return GestureDetector(
                        onTap: () => Get.toNamed('/materi-detail-list', arguments: {'lessonId': materi.id}),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 4),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Display cover image of the lesson in the recommendation section
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: materi.coverUrl != null
                                    ? Image.network(
                                        materi.coverUrl!,
                                        width: 120,
                                        height: 80,
                                        fit: BoxFit.cover,
                                      )
                                    : const SizedBox(
                                        width: 120,
                                        height: 80,
                                        child: Icon(Icons.image, size: 40),
                                      ),
                              ),
                              const SizedBox(height: 8),
                              Text(materi.title, textAlign: TextAlign.center),
                            ],
                          ),
                        ),
                      );
                    },
                  )
                else
                  // ListView for recommendations (only title)
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.LessonList.length,
                    itemBuilder: (context, index) {
                      var materi = controller.LessonList[index];
                      return GestureDetector(
                        onTap: () => Get.toNamed('/materi-detail-list', arguments: {'lessonId': materi.id}),
                        child: Container(
                          width: double.infinity, // Span full width of the device
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 4),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Text(
                              materi.title,
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
              ],
            );
          }),
        ),
      ),
      bottomNavigationBar: const CustomNavbar(currentIndex: 1),
    );
  }
}
