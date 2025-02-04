# 자바 학습 가이드

## 1. 자바 기본 문법
자바의 기본 문법을 익히기 위한 개념을 정리합니다.

### 1.1. 변수와 자료형
```java
int number = 10;
String text = "Hello, Java!";
double pi = 3.14;
```

### 1.2. 제어문
#### 1.2.1. 조건문
```java
if (number > 5) {
    System.out.println("Number is greater than 5");
} else {
    System.out.println("Number is 5 or less");
}
```

#### 1.2.2. 반복문
```java
for (int i = 0; i < 5; i++) {
    System.out.println("Iteration: " + i);
}
```

## 2. 스레드, 제네릭, 컬렉션
자바의 고급 기능을 학습합니다.

### 2.1. 스레드
```java
class MyThread extends Thread {
    public void run() {
        System.out.println("Thread is running...");
    }
}
MyThread thread = new MyThread();
thread.start();
```

### 2.2. 제네릭
```java
class Box<T> {
    private T value;
    public void setValue(T value) { this.value = value; }
    public T getValue() { return value; }
}
Box<String> box = new Box<>();
box.setValue("Hello");
System.out.println(box.getValue());
```

### 2.3. 컬렉션
```java
import java.util.ArrayList;
ArrayList<String> list = new ArrayList<>();
list.add("Java");
list.add("Collections");
for (String item : list) {
    System.out.println(item);
}
```

## 3. 게시판 미니 프로젝트
### 3.1. 프로젝트 개요
- 사용자 로그인 / 회원가입 기능
- 게시글 CRUD (Create, Read, Update, Delete)
- 댓글 및 좋아요 기능

### 3.2. 주요 기능 구현 (Java)
#### 3.2.1. 게시글 클래스
```java
class Post {
    private int id;
    private String title;
    private String content;
    private String author;
    
    public Post(int id, String title, String content, String author) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.author = author;
    }
    public void display() {
        System.out.println("Title: " + title);
        System.out.println("Content: " + content);
        System.out.println("Author: " + author);
    }
}
```

#### 3.2.2. 게시판 기능 구현
```java
import java.util.ArrayList;

class Board {
    private ArrayList<Post> posts = new ArrayList<>();
    
    public void addPost(Post post) {
        posts.add(post);
    }
    
    public void listPosts() {
        for (Post post : posts) {
            post.display();
            System.out.println("----------------");
        }
    }
}
```

### 3.3. 실행 예제
```java
public class Main {
    public static void main(String[] args) {
        Board board = new Board();
        board.addPost(new Post(1, "Java Basics", "Learn Java from scratch.", "Alice"));
        board.addPost(new Post(2, "Advanced Java", "Exploring threads and collections.", "Bob"));
        
        board.listPosts();
    }
}
```

## 4. 결론
이 문서를 기반으로 자바의 기본 문법과 고급 개념을 학습하고, 실전 프로젝트를 통해 응용 능력을 키울 수 있습니다. 추가적으로 데이터베이스 연동과 웹 기반 프로젝트로 확장할 수도 있습니다.
