import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pbl_flutter/main.dart';

void main() {
  testWidgets('Tambah dan hapus todo', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: TodoPage()));

    // Awalnya list kosong.
    expect(find.text('To-Do List Mahasiswa'), findsOneWidget);
    expect(find.byType(ListTile), findsNothing);

    // Ketik tugas lalu tekan tombol Tambah.
    await tester.enterText(find.byType(TextField), 'Belajar Flutter');
    await tester.tap(find.text('Tambah'));
    await tester.pump();

    // Tugas muncul di list.
    expect(find.text('Belajar Flutter'), findsOneWidget);
    expect(find.byType(ListTile), findsOneWidget);

    // Hapus tugas lewat ikon delete.
    await tester.tap(find.byIcon(Icons.delete));
    await tester.pump();

    expect(find.text('Belajar Flutter'), findsNothing);
    expect(find.byType(ListTile), findsNothing);
  });

  testWidgets('Input kosong tidak menambah todo', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: TodoPage()));

    await tester.tap(find.text('Tambah'));
    await tester.pump();

    expect(find.byType(ListTile), findsNothing);
  });
}