import 'package:flutter/material.dart';

class CreateLatihanPage extends StatelessWidget {
  const CreateLatihanPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> mataKuliahList = [
      'Basis Data',
      'Jaringan Komputer',
      'Pemrograman Web',
      'Keamanan Jaringan',
    ];

    final List<String> subCpmkList = [
      '01. Pengenalan Basis Data',
      '02. Model & Perancangan Basis Data',
      '03. Structured Query Language (SQL)',
    ];

    final List<String> bloomList = [
      '1. Remember',
      '2. Understand',
      '3. Apply',
      '4. Analyze',
      '5. Evaluate',
      '6. Create',
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Buat Latihan"),
        backgroundColor: const Color(0xFF3A73DF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Pilih Mata Kuliah", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(border: OutlineInputBorder()),
              value: mataKuliahList[0],
              items: mataKuliahList.map((e) {
                return DropdownMenuItem(value: e, child: Text(e));
              }).toList(),
              onChanged: (_) {},
            ),

            const SizedBox(height: 20),
            const Text("Pilih Sub-CPMK", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(border: OutlineInputBorder()),
              value: subCpmkList[0],
              items: subCpmkList.map((e) {
                return DropdownMenuItem(value: e, child: Text(e));
              }).toList(),
              onChanged: (_) {},
            ),

            const SizedBox(height: 20),
            const Text("Tingkat Taksonomi Bloom", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(border: OutlineInputBorder()),
              value: bloomList[0],
              items: bloomList.map((e) {
                return DropdownMenuItem(value: e, child: Text(e));
              }).toList(),
              onChanged: (_) {},
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Navigasi atau aksi ketika tombol ditekan
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3A73DF),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  "Buat Latihan",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
