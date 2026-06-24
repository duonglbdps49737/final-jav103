package jdbc.finalasm_java103.entity;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data

@Entity
@Table(name = "Students")
public class Students {
    @Id
    String email;
    String password;
    String fullname;
    String photo;
    float mark;

    @Builder.Default
    @Temporal(TemporalType.DATE)
    @Column(name = "Birthday")
    Date birthday = new Date();
}
