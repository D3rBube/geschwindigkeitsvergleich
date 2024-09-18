import 'dart:math';

class RandomNumberList {
  int length;
  int maxValue;
  late List<int> numbers;

  RandomNumberList(this.length, this.maxValue) {
    numbers = generateRandomList();
  }

  List<int> generateRandomList() {
    Random random = Random();
    return List<int>.generate(length, (index) => random.nextInt(maxValue));
  }

  void insertionSort(List<int> list) {
    for (int i = 1; i < list.length; i++) {
      int key = list[i];
      int j = i - 1;

      while (j >= 0 && list[j] > key) {
        list[j + 1] = list[j];
        j = j - 1;
      }
      list[j + 1] = key;
    }
  }

  void bubbleSort(List<int> list) {
    for (int i = 0; i < list.length - 1; i++) {
      for (int j = 0; j < list.length - i - 1; j++) {
        if (list[j] > list[j + 1]) {
          int temp = list[j];
          list[j] = list[j + 1];
          list[j + 1] = temp;
        }
      }
    }
  }

  void mergeSort(List<int> list, int left, int right) {
    if (left < right) {
      int middle = (left + right) ~/ 2;
      mergeSort(list, left, middle);
      mergeSort(list, middle + 1, right);
      merge(list, left, middle, right);
    }
  }

  void merge(List<int> list, int left, int middle, int right) {
    int n1 = middle - left + 1;
    int n2 = right - middle;

    List<int> leftList = List.filled(n1, 0);
    List<int> rightList = List.filled(n2, 0);

    for (int i = 0; i < n1; i++) {
      leftList[i] = list[left + i];
    }
    for (int j = 0; j < n2; j++) {
      rightList[j] = list[middle + 1 + j];
    }

    int i = 0, j = 0;
    int k = left;

    while (i < n1 && j < n2) {
      if (leftList[i] <= rightList[j]) {
        list[k] = leftList[i];
        i++;
      } else {
        list[k] = rightList[j];
        j++;
      }
      k++;
    }

    while (i < n1) {
      list[k] = leftList[i];
      i++;
      k++;
    }

    while (j < n2) {
      list[k] = rightList[j];
      j++;
      k++;
    }
  }
}
