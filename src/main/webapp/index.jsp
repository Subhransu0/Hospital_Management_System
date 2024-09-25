<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>BetterCare</title>
    <%@ include file="component/allcss.jsp"%>
    <style>
        /* Customize the carousel image size */
        .carousel-inner img {
            width: 100%;
            max-height: 500px;
            object-fit: cover;
        }

        /* Styling for the features section */
        .container {
            margin-top: 40px;
        }

        .card {
            border: none;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .card-body {
            padding: 20px;
            text-align: center;
        }

        .card p {
            font-size: 1.1rem;
            color: #555;
        }

        .fs-5 {
            font-weight: bold;
            font-size: 1.3rem;
        }

        /* Doctor image styling */
        .doctor-image {
            max-width: 100%;
            border-radius: 10px;
            object-fit: cover;
        }

        


.team-member img:hover {
    transform: scale(1.05); /* Scale up on hover */
}


        /* Media queries for responsive design */
        @media (max-width: 768px) {
            .card-body p {
                font-size: 1rem;
            }
            .fs-5 {
                font-size: 1.1rem;
            }
        }
    </style>
</head>
<body>
    <%@ include file="component/navbar.jsp"%>

    <!-- Carousel -->
    <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="img/d1.jpg" class="d-block w-100" alt="Slide 1">
            </div>
            <div class="carousel-item">
                <img src="img/d2.jpg" class="d-block w-100" alt="Slide 2">
            </div>
            <div class="carousel-item">
                <img src="img/d5.jpg" class="d-block w-100" alt="Slide 3">
            </div>
        </div>

        <!-- Previous control -->
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>

        <!-- Next control -->
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

    <!-- Key Features Section -->
    <div class="container p-3">
        <p class="text-center fs-2">Key Features of our Hospital</p>
        <div class="row">
            <div class="col-md-8 p-5">
                <div class="row">
                    <div class="col-md-6">
                        <div class="card paint-card">
                            <div class="card-body">
                                <p class="fs-5">100% Safety</p>
                                <p>Our hospital ensures 100% safety with state-of-the-art equipment and procedures that guarantee patient care.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card paint-card">
                            <div class="card-body">
                                <p class="fs-5">Clean Environment</p>
                                <p>We provide a clean and sanitized environment to make sure every patient feels safe and comfortable during their stay.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card paint-card">
                            <div class="card-body">
                                <p class="fs-5">Friendly Doctors</p>
                                <p>Our highly trained, friendly doctors offer personalized care and attention to every patient, ensuring a smooth recovery process.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card paint-card">
                            <div class="card-body">
                                <p class="fs-5">Medical Research</p>
                                <p>Our medical research division is at the forefront of healthcare advancements, offering cutting-edge treatments and innovations.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <img src="img/doctor2.jpg" class="doctor-image" alt="Doctor Image">
            </div>
        </div>
    </div>

    

    <!-- Our Team Section -->
    <div class="container p-2">
    <p class="text-center fs-2">Our Team</p>
    <div class="row">
        <div class="col-md-3">
            <div class="card paint-card">
                <div class="card-body text-center">
                    <img src="img/doctor12.jpg"  height="300px" class="team-member" alt="Doctor 1">
                    <p class="fw-bold fs-5">Johnshon Doman</p>
                    <p class="fs-7">(CEO & Chairman)</p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card paint-card">
                <div class="card-body text-center">
                    <img src="img/doctor2.jpg"  height="300px" class="team-member" alt="Doctor 2">
                    <p class="fw-bold fs-5">Jane Smith</p>
                    <p class="fs-7">(Chief Medical Officer)</p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card paint-card">
                <div class="card-body text-center">
                    <img src="img/doctor11.jpg"  height="300px" class="team-member" alt="Doctor 2">
                    <p class="fw-bold fs-5">Emily White</p>
                    <p class="fs-7">(Pediatrician)</p>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card paint-card">
                <div class="card-body text-center">
                    <img src="img/doctor.jpg"  height="300px" class="team-member" alt="Doctor 2">
                    <p class="fw-bold fs-5">Michael Brown</p>
                    <p class="fs-7">(Head of Surgery)</p>
                </div>
            </div>
        </div>
        
        
       
    </div>
</div>

<%@ include file="component/footer.jsp"%>

</body>
</html>
