program Todolist;

uses crt;

var
  option: Integer;
  taskList: array[1..100] of string;
  taskCount: Integer;

procedure displayMenu();
begin
  writeln('==============================');
  writeln('        APLIKASI TODOLIST      ');
  writeln('==============================');
  writeln('1. Tambahkan tugas');
  writeln('2. Lihat daftar tugas');
  writeln('3. Hapus tugas');
  writeln('4. Keluar');
end;

procedure addTask();
var
  task: string;
begin
  writeln('Masukkan tugas baru:');
  readln(task);
  taskCount := taskCount + 1;
  taskList[taskCount] := task;
  writeln('Tugas berhasil ditambahkan!');
end;

procedure displayTasks();
var
  i: Integer;
begin
  if taskCount = 0 then
    writeln('Daftar tugas kosong')
  else begin
    writeln('Daftar tugas:');
    for i := 1 to taskCount do
      writeln(i, '. ', taskList[i]);
  end;
end;

procedure deleteTask();
var
  i, taskNo: Integer;
begin
  if taskCount = 0 then
    writeln('Daftar tugas kosong')
  else begin
    writeln('Masukkan nomor tugas yang ingin dihapus:');
    readln(taskNo);
    if (taskNo < 1) or (taskNo > taskCount) then
      writeln('Nomor tugas tidak valid')
    else begin
      for i := taskNo to taskCount - 1 do
        taskList[i] := taskList[i+1];
      taskCount := taskCount - 1;
      writeln('Tugas berhasil dihapus!');
    end;
  end;
end;

begin
  taskCount := 0;

  repeat
    clrscr;
    displayMenu();
    writeln('Masukkan opsi: ');
    readln(option);

    case option of
      1: addTask();
      2: displayTasks();
      3: deleteTask();
      4: writeln('Terima kasih telah menggunakan aplikasi todolist!');
      else writeln('Opsi tidak valid');
    end;

    writeln('Tekan sembarang tombol untuk melanjutkan...');
    readkey;
  until option = 4;
end.
