package jdbc.finalasm_java103.dao;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.FlushModeType;
import jakarta.persistence.Persistence;

public class OPEU {
    private static EntityManagerFactory factory;
    private static EntityManager em;
    public static EntityManager getEntityManager() {
        if (factory == null || !factory.isOpen()) {
            factory = Persistence.createEntityManagerFactory("OPEU");
        }
        if (em == null || !em.isOpen()) {
            em = factory.createEntityManager();
            em.setFlushMode(FlushModeType.COMMIT);
        }
        return em;
    }
}
