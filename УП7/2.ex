    defmodule Student do
    # Дефиниране на структурата Student
    defstruct name: "", faculty_number: "", grade: 0.0

  # Функция за добавяне на нов студент
  def add_student(students, name, faculty_number, grade) do
    # Проверка за уникалност на факултетния номер
    case Enum.find(students, fn student -> student.faculty_number == faculty_number end) do
      nil ->
        new_student = %Student{name: name, faculty_number: faculty_number, grade: grade}
        IO.puts("New student added successfully!")
        students ++ [new_student]

      _ ->
        IO.puts("Error: Student with this faculty number already exists!")
        students
    end
  end

  # Функция за изтриване на студент по факултетен номер
  def delete_student(students, faculty_number) do
    case Enum.find(students, fn student -> student.faculty_number == faculty_number end) do
      nil ->
        IO.puts("No student found with the given faculty number!")
        students

      student ->
        IO.puts("Student #{student.name} deleted successfully!")
        Enum.filter(students, fn student -> student.faculty_number != faculty_number end)
    end
  end

  # Функция за показване на всички студенти
  def show_students(students) do
    IO.puts("=== List of Students ===")
    Enum.each(students, fn student ->
      IO.puts("Name: #{student.name}, Faculty Number: #{student.faculty_number}, Grade: #{student.grade}")
    end)
    IO.puts("=========================")
  end

  # Функция за обновяване на информация за студент
  def update_student(students, faculty_number, new_name, new_grade) do
    updated_students = Enum.map(students, fn student ->
      if student.faculty_number == faculty_number do
        %Student{student | name: new_name, grade: new_grade}
      else
        student
      end
    end)

    IO.puts("Student updated successfully!")
    updated_students
  end

  # Функция за записване на студентите в текстов файл
  def save_to_file(students) do
    File.write!("students.txt", "")
    Enum.each(students, fn student ->
      File.write!("students.txt", "#{student.name},#{student.faculty_number},#{student.grade}\n", [:append])
    end)

    IO.puts("Student data saved to file!")
  end

  # Функция за зареждане на студентите от текстов файл
  def load_from_file() do
    if File.exists?("students.txt") do
      File.read!("students.txt")
      |> String.split("\n", trim: true)
      |> Enum.map(fn line ->
        [name, faculty_number, grade] = String.split(line, ",")
        %Student{name: name, faculty_number: faculty_number, grade: String.to_float(grade)}
      end)
    else
      []
    end
  end
end

defmodule Main do
  def run do
    # Зареждаме съществуващите студенти
    students = Student.load_from_file()

    loop(students)
  end

  # Главна функция за менюто
  defp loop(students) do
    IO.puts("\n=== Menu ===")
    IO.puts("1. Enter new student")
    IO.puts("2. Delete student")
    IO.puts("3. Show existing students")
    IO.puts("4. Update student")
    IO.puts("5. Exit")
    IO.puts("Choose an option:")

    option = IO.gets("> ") |> String.trim() |> String.to_integer()

    case option do
      1 ->
        IO.puts("Enter name:")
        name = IO.gets("> ") |> String.trim()

        IO.puts("Enter faculty number:")
        faculty_number = IO.gets("> ") |> String.trim()

        IO.puts("Enter grade:")
        grade = IO.gets("> ") |> String.trim() |> String.to_float()

        students = Student.add_student(students, name, faculty_number, grade)
        Student.save_to_file(students)
        loop(students)

      2 ->
        IO.puts("Enter faculty number to delete:")
        faculty_number = IO.gets("> ") |> String.trim()
        students = Student.delete_student(students, faculty_number)
        Student.save_to_file(students)
        loop(students)

      3 ->
        Student.show_students(students)
        loop(students)

      4 ->
        IO.puts("Enter faculty number to update:")
        faculty_number = IO.gets("> ") |> String.trim()

        IO.puts("Enter new name:")
        new_name = IO.gets("> ") |> String.trim()

        IO.puts("Enter new grade:")
        new_grade = IO.gets("> ") |> String.trim() |> String.to_float()

        students = Student.update_student(students, faculty_number, new_name, new_grade)
        Student.save_to_file(students)
        loop(students)

      5 ->
        IO.puts("Goodbye!")
        :ok

      _ ->
        IO.puts("Invalid option, please try again.")
        loop(students)
    end
  end
end

Main.run()

