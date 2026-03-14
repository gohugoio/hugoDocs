<!DOCTYPE html>
<html lang="hi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FF ID STORE | Premium Gaming Accounts</title>
    
    <!-- Font Awesome Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            color: #333;
        }

        /* Animated Background */
        .animated-bg {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
            background-size: 400% 400%;
            animation: gradient 15s ease infinite;
        }

        @keyframes gradient {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        /* Header Styles */
        .header {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            padding: 20px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.2);
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .header h1 {
            font-size: 2.5em;
            background: linear-gradient(45deg, #FF6B6B, #4ECDC4);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            animation: titleGlow 2s ease-in-out infinite;
        }

        @keyframes titleGlow {
            0%, 100% { filter: drop-shadow(0 0 5px rgba(255,107,107,0.5)); }
            50% { filter: drop-shadow(0 0 20px rgba(78,205,196,0.8)); }
        }

        .header p {
            color: #666;
            margin-top: 10px;
            font-size: 1.1em;
        }

        /* Main Container */
        .container {
            max-width: 1200px;
            margin: 30px auto;
            padding: 0 20px;
        }

        /* Filter Buttons */
        .filters {
            display: flex;
            justify-content: center;
            gap: 15px;
            margin-bottom: 30px;
            flex-wrap: wrap;
        }

        .filter-btn {
            padding: 12px 30px;
            border: none;
            border-radius: 50px;
            background: white;
            color: #333;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        .filter-btn:hover, .filter-btn.active {
            background: linear-gradient(45deg, #FF6B6B, #4ECDC4);
            color: white;
            transform: translateY(-3px);
        }

        /* Products Grid */
        .products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 25px;
            margin-bottom: 40px;
        }

        /* Product Card */
        .product-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
            transition: all 0.3s;
            animation: fadeInUp 0.6s ease-out;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .product-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0,0,0,0.3);
        }

        .product-badge {
            background: linear-gradient(45deg, #FF6B6B, #4ECDC4);
            color: white;
            padding: 8px 20px;
            position: absolute;
            top: 20px;
            right: -30px;
            transform: rotate(45deg);
            font-size: 0.9em;
            font-weight: bold;
            box-shadow: 0 2px 10px rgba(0,0,0,0.2);
        }

        .product-image {
            width: 100%;
            height: 200px;
            object-fit: cover;
            transition: transform 0.5s;
        }

        .product-card:hover .product-image {
            transform: scale(1.1);
        }

        .product-info {
            padding: 20px;
            position: relative;
        }

        .product-title {
            font-size: 1.5em;
            margin-bottom: 10px;
            color: #333;
        }

        .product-details {
            list-style: none;
            margin: 15px 0;
        }

        .product-details li {
            padding: 8px 0;
            border-bottom: 1px solid #eee;
            color: #666;
        }

        .product-details li i {
            margin-right: 10px;
            color: #4ECDC4;
        }

        .price {
            font-size: 2em;
            font-weight: bold;
            background: linear-gradient(45deg, #FF6B6B, #4ECDC4);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin: 15px 0;
        }

        .buy-btn {
            width: 100%;
            padding: 15px;
            border: none;
            border-radius: 50px;
            background: linear-gradient(45deg, #FF6B6B, #4ECDC4);
            color: white;
            font-size: 1.1em;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
            position: relative;
            overflow: hidden;
        }

        .buy-btn:before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.3), transparent);
            transition: left 0.5s;
        }

        .buy-btn:hover:before {
            left: 100%;
        }

        .buy-btn:hover {
            transform: scale(1.02);
            box-shadow: 0 10px 20px rgba(255,107,107,0.4);
        }

        /* Payment Modal */
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.8);
            backdrop-filter: blur(5px);
            z-index: 2000;
            animation: fadeIn 0.3s;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .modal-content {
            background: white;
            max-width: 500px;
            margin: 50px auto;
            padding: 30px;
            border-radius: 20px;
            position: relative;
            animation: slideIn 0.3s;
        }

        @keyframes slideIn {
            from {
                transform: translateY(-100px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        .close-btn {
            position: absolute;
            top: 20px;
            right: 20px;
            font-size: 1.5em;
            cursor: pointer;
            color: #999;
            transition: color 0.3s;
        }

        .close-btn:hover {
            color: #FF6B6B;
        }

        .qr-container {
            text-align: center;
            margin: 20px 0;
        }

        .qr-code {
            width: 200px;
            height: 200px;
            margin: 20px auto;
            padding: 10px;
            background: #f5f5f5;
            border-radius: 10px;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }

        .payment-details {
            background: #f5f5f5;
            padding: 20px;
            border-radius: 10px;
            margin: 20px 0;
        }

        .upi-id {
            font-size: 1.2em;
            color: #333;
            margin: 10px 0;
            padding: 10px;
            background: white;
            border-radius: 5px;
            border: 2px dashed #4ECDC4;
        }

        .telegram-btn {
            display: inline-block;
            padding: 15px 40px;
            background: #0088cc;
            color: white;
            text-decoration: none;
            border-radius: 50px;
            font-weight: 600;
            transition: all 0.3s;
            margin: 10px 0;
        }

        .telegram-btn:hover {
            background: #006699;
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0,136,204,0.3);
        }

        /* Features Section */
        .features {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin: 40px 0;
        }

        .feature-box {
            background: rgba(255,255,255,0.95);
            padding: 25px;
            border-radius: 15px;
            text-align: center;
            transition: transform 0.3s;
        }

        .feature-box:hover {
            transform: translateY(-5px);
        }

        .feature-icon {
            font-size: 3em;
            margin-bottom: 15px;
            background: linear-gradient(45deg, #FF6B6B, #4ECDC4);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        /* Toast Notification */
        .toast {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background: white;
            padding: 15px 25px;
            border-radius: 50px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
            display: none;
            align-items: center;
            gap: 10px;
            animation: slideInRight 0.3s;
            z-index: 3000;
        }

        @keyframes slideInRight {
            from {
                transform: translateX(100%);
                opacity: 0;
            }
            to {
                transform: translateX(0);
                opacity: 1;
            }
        }

        .toast.success {
            border-left: 4px solid #4ECDC4;
        }

        .toast i {
            color: #4ECDC4;
            font-size: 1.2em;
        }

        /* Footer */
        .footer {
            background: rgba(0,0,0,0.8);
            color: white;
            padding: 30px;
            margin-top: 50px;
            text-align: center;
        }

        .social-links {
            margin: 20px 0;
        }

        .social-links a {
            color: white;
            font-size: 1.5em;
            margin: 0 10px;
            transition: color 0.3s;
        }

        .social-links a:hover {
            color: #4ECDC4;
        }

        /* Loading Spinner */
        .spinner {
            display: none;
            width: 50px;
            height: 50px;
            border: 5px solid #f3f3f3;
            border-top: 5px solid #4ECDC4;
            border-radius: 50%;
            animation: spin 1s linear infinite;
            margin: 20px auto;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .header h1 {
                font-size: 1.8em;
            }
            
            .products-grid {
                grid-template-columns: 1fr;
            }
            
            .modal-content {
                margin: 20px;
                padding: 20px;
            }
            
            .qr-code {
                width: 150px;
                height: 150px;
            }
        }
    </style>
</head>
<body>
    <div class="animated-bg"></div>

    <!-- Header -->
    <header class="header">
        <h1><i class="fas fa-fire"></i> FF ID STORE <i class="fas fa-fire"></i></h1>
        <p>Premium Gaming Accounts | 100% Safe & Secure</p>
        <p><i class="fas fa-star" style="color: #FFD700;"></i> Trusted by 10,000+ Gamers <i class="fas fa-star" style="color: #FFD700;"></i></p>
    </header>

    <!-- Main Container -->
    <div class="container">
        <!-- Filter Buttons -->
        <div class="filters">
            <button class="filter-btn active" onclick="filterProducts('all')">All IDs</button>
            <button class="filter-btn" onclick="filterProducts('legendary')">Legendary</button>
            <button class="filter-btn" onclick="filterProducts('pro')">Pro Player</button>
            <button class="filter-btn" onclick="filterProducts('special')">Special</button>
        </div>

        <!-- Products Grid -->
        <div class="products-grid" id="productsGrid">
            <!-- Product 1 - Legendary -->
            <div class="product-card" data-category="legendary">
                <div style="position: relative; overflow: hidden;">
                    <span class="product-badge">HOT 🔥</span>
                    <img src="https://via.placeholder.com/400x200/FF6B6B/ffffff?text=FF+ID+1" alt="Legendary ID" class="product-image">
                </div>
                <div class="product-info">
                    <h3 class="product-title"><i class="fas fa-crown" style="color: #FFD700;"></i> Legendary FF ID</h3>
                    <ul class="product-details">
                        <li><i class="fas fa-level-up-alt"></i> Level: 70 (Max)</li>
                        <li><i class="fas fa-gift"></i> Rare Bundles: 25+</li>
                        <li><i class="fas fa-medal"></i> Grandmaster Tier</li>
                        <li><i class="fas fa-calendar"></i> Account Age: 3 Years</li>
                        <li><i class="fas fa-shield-alt"></i> Email Verified</li>
                    </ul>
                    <div class="price">₹499</div>
                    <button class="buy-btn" onclick="showPayment('Legendary FF ID', 499)">
                        <i class="fas fa-shopping-cart"></i> Buy Now
                    </button>
                </div>
            </div>

            <!-- Product 2 - Pro Player -->
            <div class="product-card" data-category="pro">
                <div style="position: relative; overflow: hidden;">
                    <span class="product-badge" style="background: linear-gradient(45deg, #4ECDC4, #FF6B6B);">BESTSELLER</span>
                    <img src="https://via.placeholder.com/400x200/4ECDC4/ffffff?text=FF+ID+2" alt="Pro ID" class="product-image">
                </div>
                <div class="product-info">
                    <h3 class="product-title"><i class="fas fa-gamepad"></i> Pro Player ID</h3>
                    <ul class="product-details">
                        <li><i class="fas fa-level-up-alt"></i> Level: 65</li>
                        <li><i class="fas fa-ticket-alt"></i> Elite Pass: Lifetime</li>
                        <li><i class="fas fa-trophy"></i> Diamond Tier</li>
                        <li><i class="fas fa-calendar"></i> Account Age: 2 Years</li>
                        <li><i class="fas fa-star"></i> 100+ Skins</li>
                    </ul>
                    <div class="price">₹349</div>
                    <button class="buy-btn" onclick="showPayment('Pro Player ID', 349)">
                        <i class="fas fa-shopping-cart"></i> Buy Now
                    </button>
                </div>
            </div>

            <!-- Product 3 - Special Edition -->
            <div class="product-card" data-category="special">
                <div style="position: relative; overflow: hidden;">
                    <span class="product-badge">LIMITED</span>
                    <img src="https://via.placeholder.com/400x200/23d5ab/ffffff?text=FF+ID+3" alt="Special ID" class="product-image">
                </div>
                <div class="product-info">
                    <h3 class="product-title"><i class="fas fa-dragon"></i> Special Edition ID</h3>
                    <ul class="product-details">
                        <li><i class="fas fa-level-up-alt"></i> Level: 68</li>
                        <li><i class="fas fa-gem"></i> Rare Emotes: 50+</li>
                        <li><i class="fas fa-mask"></i> Exclusive Bundles</li>
                        <li><i class="fas fa-calendar"></i> Account Age: 1.5 Years</li>
                        <li><i class="fas fa-heart"></i> OG Name</li>
                    </ul>
                    <div class="price">₹599</div>
                    <button class="buy-btn" onclick="showPayment('Special Edition ID', 599)">
                        <i class="fas fa-shopping-cart"></i> Buy Now
                    </button>
                </div>
            </div>
        </div>

        <!-- Features Section -->
        <div class="features">
            <div class="feature-box">
                <div class="feature-icon"><i class="fas fa-bolt"></i></div>
                <h3>Instant Delivery</h3>
                <p>Payment ke turant baad ID mil jayegi</p>
            </div>
            <div class="feature-box">
                <div class="feature-icon"><i class="fas fa-shield-alt"></i></div>
                <h3>100% Secure</h3>
                <p>Safe & Secure Transaction</p>
            </div>
            <div class="feature-box">
                <div class="feature-icon"><i class="fas fa-headset"></i></div>
                <h3>24/7 Support</h3>
                <p>Koi bhi problem ho to help karenge</p>
            </div>
            <div class="feature-box">
                <div class="feature-icon"><i class="fas fa-money-bill-wave"></i></div>
                <h3>Money Back</h3>
                <p>7 Days Replacement Guarantee</p>
            </div>
        </div>
    </div>

    <!-- Payment Modal -->
    <div id="paymentModal" class="modal">
        <div class="modal-content">
            <span class="close-btn" onclick="closeModal()">&times;</span>
            <h2><i class="fas fa-qrcode"></i> Payment Details</h2>
            
            <div class="qr-container">
                <div class="qr-code" id="qrCode">
                    <!-- QR Code will be generated here -->
                    <div style="width: 100%; height: 100%; background: linear-gradient(45deg, #FF6B6B, #4ECDC4); border-radius: 10px; display: flex; align-items: center; justify-content: center; color: white; font-weight: bold;">SCAN QR</div>
                </div>
            </div>

            <div class="payment-details">
                <h3 id="productNameDisplay">Product Name</h3>
                <p>Amount: ₹<span id="amountDisplay">0</span></p>
                <div class="upi-id">
                    <i class="fas fa-copy" style="cursor: pointer; float: right;" onclick="copyUPI()"></i>
                    UPI ID: store@okhdfcbank
                </div>
            </div>

            <div style="text-align: center;">
                <p>✅ Payment ke baad screenshot bhejna zaroori hai</p>
                <a href="https://t.me/YOUR_TELEGRAM" class="telegram-btn" target="_blank">
                    <i class="fab fa-telegram-plane"></i> Send Screenshot on Telegram
                </a>
                <p style="margin-top: 10px;">📱 Ya phir is number par bheje: +91 98765 43210</p>
            </div>
        </div>
    </div>

    <!-- Loading Spinner -->
    <div class="spinner" id="loadingSpinner"></div>

    <!-- Toast Notification -->
    <div class="toast" id="toast">
        <i class="fas fa-check-circle"></i>
        <span id="toastMessage">Copied to clipboard!</span>
    </div>

    <!-- Footer -->
    <footer class="footer">
        <div class="social
