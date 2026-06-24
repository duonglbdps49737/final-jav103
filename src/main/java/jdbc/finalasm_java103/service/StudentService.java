package jdbc.finalasm_java103.service;

import jdbc.finalasm_java103.entity.Students;

import java.util.List;

public interface StudentService {
    List<Students> findAll();
    void create(Students entity);
    void update(Students entity);
    Students findByEmail(String email);
}
