package jdbc.finalasm_java103.service;

import jdbc.finalasm_java103.dao.StudentDAO;
import jdbc.finalasm_java103.dao.StudentDAOImpl;
import jdbc.finalasm_java103.entity.Students;

import java.util.List;

public class StudentServiceImpl implements StudentService {
    StudentDAO dao = new StudentDAOImpl();
    @Override
    public List<Students> findAll() {
        return dao.findAll();
    }

    @Override
    public void create(Students entity) {
        dao.create(entity);
    }

    @Override
    public void update(Students entity) {
        dao.update(entity);
    }

    @Override
    public Students findByEmail(String email) {
        return dao.findByEmail(email);
    }
}
