package jdbc.finalasm_java103.dao;

import jakarta.persistence.EntityManager;
import jdbc.finalasm_java103.entity.Students;

import java.util.List;

public class StudentDAOImpl implements StudentDAO {
    EntityManager em = OPEU.getEntityManager();
    @Override
    public List<Students> findAll() {
        var jpql = "SELECT o FROM Students o";
        var query = em.createQuery(jpql, Students.class);
        return query.getResultList();
    }

    @Override
    public void create(Students entity) {
        try{
            em.getTransaction().begin();
            em.persist(entity);
            em.getTransaction().commit();
        }catch (IllegalStateException ex){
            em.getTransaction().rollback();
            throw ex;
        }
    }

    @Override
    public void update(Students entity) {
        try {
            em.getTransaction().begin();
            em.merge(entity);
            em.getTransaction().commit();
        } catch (IllegalStateException ex){
            em.getTransaction().rollback();
            throw ex;
        }
    }

    @Override
    public Students findByEmail(String email) {
        var jpql = "SELECT o FROM Students o WHERE o.email = :email";
        var query = em.createQuery(jpql, Students.class);
        query.setParameter("email", email);
        return query.getSingleResult();
    }
}
